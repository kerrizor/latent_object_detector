require "latent_object_detector/version"

class LatentObjectDetector

  attr_accessor :klass

  def self.for(klass)
    new(klass)
  end

  def initialize(klass)
    self.klass = klass
  end

  def suspicious_methods
    explicit_instance_methods.select{|m| (words_in_method(m.to_s) & potential_objects).size > 0}
  end

  def potential_objects
    words_hash = explicit_instance_methods.inject({}) {|h,m| h[m] = words_in_method(m); h}
    hits = words_hash.values.flatten.inject({}){|h,w| h[w] ||= 0; h[w] += 1; h}.select{|k,v| v > 1}.keys
    hits.select{|k| k.size > 2}
  end

  private

  def explicit_instance_methods
    self.klass.instance_methods.select{|m| self.klass.new.method(m).owner == self.klass }
  end

  def words_in_method(name)
    name.to_s.gsub(/[^a-z\_]/i,'').split('_')
  end

end