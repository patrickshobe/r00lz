# frozen_string_literal: true

require 'r00lz/version'

  class FileModel
    def initialize(fn)
      @fn = fn
      cont = File.read fn
      @hash = JSON.load cont
    end

    def [](field)
      @hash[field.to_s]
    end

    def self.find(id)
      new "data/#{id}.json"
    end
  end

module R00lz
  require 'erb'
  require 'json'
  class Object
    def self.const_missing(const)
      require R00lz.to_underscore(const.to_s)
      Object.const_get(const)
    end
  end


  class Error < StandardError; end

  def self.to_underscore(string)
    string.gsub(
      /([A-Z]+)([A-Z][a-z])/,
      '\1_\2'
    ).gsub(
      /([a-z\d])([A-Z])/,
      '\1_\2'
    ).downcase
  end

  class App
    def call(env)
      klass, action = cont_and_act(env)
      text = klass.new(env).send(action)
      [200, { 'Content-Type' => 'text/html' }, [text]]
    end

    def cont_and_act(env)
      _, controller, action, _after = env['PATH_INFO'].split('/')
      controller = "#{controller.capitalize}Controller"
      [Object.const_get(controller), action]
    end
  end


  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(name, bin = binding())
      template = "app/views/#{name}.html.erb"
      erb = ERB.new(File.read(template))
      erb.result(bin)
    end

    def request
      @request ||= Rack::Request.new @env
    end

    def params
      request.params
    end
  end
end
