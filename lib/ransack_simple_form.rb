require "ransack_simple_form/version"
require 'simple_form'
require 'ransack'
require 'ransack/helpers/form_builder'

module RansackSimpleForm
  module FormHelper
    def ransack_simple_form_for(*args, &block)
      opts = args.extract_options!
      opts[:builder] = FormBuilder

      # add the default form class
      # (works whether existing class is a String like
      # "foo bar" or an Array like ["foo", "bar"])
      opts[:html] ||= {}
      opts[:html][:class] ||= []
      opts[:html][:class] << ' ' if opts[:html][:class].is_a? String
      opts[:html][:novalidate] ||= true

      search_form_for(*args, opts, &block)
    end
  end

  class FormBuilder < SimpleForm::FormBuilder
    attr_reader :ransack_form_builder

    def initialize(*args)
      super
      @ransack_form_builder = Ransack::Helpers::FormBuilder.new(*args)
    end

    delegate *(Ransack::Helpers::FormBuilder.instance_methods - ::ActionView::Helpers::FormBuilder.instance_methods), to: :ransack_form_builder
    #delegate :label, to: :ransack_form_builder
    def label(method, *args, &block)
      options = args.extract_options!
      i18n = options[:i18n] || {}
      text = object.translate(
          method, i18n.reverse_merge(:include_associations => true)
      ) if object.respond_to? :translate
      text ||= args.first
      super(method, text, options, &block)
    end
  end
end

ActionController::Base.helper RansackSimpleForm::FormHelper
