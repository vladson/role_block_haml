module RoleBlockHaml
  module HamlExtension

    def self.included(receiver)

      receiver.instance_eval do
        def parse_class_and_id(list)
          attributes = {}
          return attributes if list.empty?

          list.scan(/(@{2}|[#\@.])([-:_a-zA-Z0-9]+)/) do |type, property|
            case type
              when '.'
                if attributes['class']
                  attributes['class'] += " "
                else
                  attributes['class'] = ""
                end
                attributes['class'] += property
              when '#' then attributes['id'] = property
              when '@'
                if attributes['data-role']
                  attributes['data-role'] += ' '
                else
                  attributes['data-role'] = ''
                end
                attributes['data-role'] += property
              when '@@'
                if attributes['data-block']
                  attributes['data-block'] += ' '
                else
                  attributes['data-block'] = ''
                end
                attributes['data-block'] += property
            end
          end
          attributes
        end
      end

      receiver.send :include, InstanceMethods
      receiver.class_eval do
        alias_method_chain :process_line, :feature
        alias_method_chain :parse_tag, :feature
      end

    end

    module InstanceMethods

      def process_line_with_feature(text, index)
        if text[0] == '@'
          @index = index + 1
          if text[1] == '@'
            @index = index + 1
          end
          push div(text)
        else
          self.send(:process_line_without_feature, text, index)
        end
      end

      class FakeLine
        def initialize(value)
          @value = value
        end

        def scan(regexp)
          @value
        end
      end

      def parse_tag_with_feature(line)
        self.send(:parse_tag_without_feature, FakeLine.new(line.scan(/%([-:\w]+)([-:\w\.\#\@]*)(.*)/)))
      end
    end
  end

  def self.install_to_haml!
    Haml::Parser.send :include, RoleBlockHaml::HamlExtension
  end

  if defined? ::Rails
    class Engine < ::Rails::Engine
      initializer 'role_block_haml' do |app|
        if defined? Haml::Parser
          RoleBlockHaml.install_to_haml!
        end
      end
    end
  end
end
