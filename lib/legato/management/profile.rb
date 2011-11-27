module Legato
  module Management
    class Profile
      extend Finder

      def self.default_path
        "/accounts/~all/webproperties/~all/profiles"
      end

      def path
        self.class.default_path + "/" + id.to_s
      end

      attr_accessor :id, :name, :user

      def initialize(attributes, user)
        self.user = user
        self.id = attributes['id']
        self.name = attributes['name']
      end

      def self.for_account(account)
        all(account.user, account.path+'/webproperties/~all/profiles')
      end

      def self.for_web_property(web_property)
        all(web_property.user, web_property.path+'/profiles')
      end
    end
  end
end
