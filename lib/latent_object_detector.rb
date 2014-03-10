require "latent_object_detector/version"

module LatentObjectDetector
  class Detector
    attr_accessor :klass

    def self.for(klass)
      new(klass)
    end

    def initialize(klass)
      self.klass = klass
    end

    def suspicious_methods
      @suspicious_methods ||=
      methods_owned_by_klass.select{ |m| (words_in_method(m.to_s) & potential_objects).size > 0 }
    end

    def potential_objects
      @potential_objects ||=
      begin
      common_words = find_common_words_in(hash_of_words_used_in_methods)
      words_used_more_than_twice(common_words)
      end
    end

    private
    def words_used_more_than_twice(hash_of_words = {})
      hash_of_words.select{ |k| k.size > 2 }
    end

    def hash_of_words_used_in_methods
      @hash_of_words_used_in_methods ||=
      methods_owned_by_klass.inject({}) do |hash, method|
        hash[method] = words_in_method(method)
        hash
      end
    end

    def find_common_words_in(hash_of_words = hash_of_words_used_in_methods)
      count_word_frequency(hash_of_words).select{ |k,v| v > 1 }.keys
    end

    def count_word_frequency(hash_of_words = {})
      hash_of_words.values.flatten.inject({}) do |hash, word|
        hash[word] ||= 0
        hash[word] += 1
        hash
      end
    end

    def methods_owned_by_klass
      @methods_owned_by_klass ||=
      all_instance_methods_of_klass.select{ |method| method_is_owned_by_klass? method }
    end

    def method_is_owned_by_klass?(method)
      self.klass.new.method(method).owner == self.klass
    end

    def all_instance_methods_of_klass
      self.klass.instance_methods
    end

    def words_in_method(name)
      name.to_s.gsub(/[^a-z\_]/i,'').split('_')
    end
  end
end