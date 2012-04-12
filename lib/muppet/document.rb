module Muppet
  module Document
    module ClassMethods

      def collection_name
        self.to_s
      end

      def collection
        Muppet.database.collection(collection_name)
      end

      def find_one(opts = {})
        result = collection.find_one(opts)
        return nil unless result
        self.new(result)
      end

      def find(opts = {})
        results = collection.find(opts)
        results.map{|result| self.new(result) }
      end

      def count
        collection.count
      end

    end

    module InstanceMethods

      def save
        self.class.collection.insert(self.attributes)
      end

      def destroy
        self.class.collection.remove(self.attributes)
      end

    end

  end
end