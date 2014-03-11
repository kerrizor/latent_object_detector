# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'latent_object_detector'
require 'latent_object_detector/version'

Gem::Specification.new do |spec|
  spec.name          = "latent_object_detector"
  spec.version       = LatentObjectDetector::VERSION
  spec.authors       = ["Coraline Ada Ehmke", "Kerri Miller"]
  spec.email         = ["coraline@idolhands.com", "kerrizor@kerrizor.com"]
  spec.description   = %q{Flags frequently used words in method names as
                            possible latent concepts.}
  spec.summary       = %q{Based on an original idea from Corey, this gem looks
                            at the methods defined on an object and looks for
                            repeated words contained in the method names, as
                            this can sometimes illuminate latent objects,
                            concepts, or relationships that don't currently
                            exist in the code (but should.)}
  spec.homepage      = "https://github.com/kerrizor/latent_object_detector"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
