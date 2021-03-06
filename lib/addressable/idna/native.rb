# encoding:utf-8
#--
# Copyright (C) 2006-2013 Bob Aman
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#++


# Accomodate Ruby 1.9 (idn_one_nine gem) and Ruby 1.8 (idn gem).
begin
  require "idn_one_nine"
rescue LoadError
  require "idn"
end

module Addressable
  module IDNA
    def self.punycode_encode(value)
      IDN::Punycode.encode(value)
    end

     def self.punycode_decode(value)
       IDN::Punycode.decode(value)
     end

    def self.unicode_normalize_kc(value)
      IDN::Stringprep.nfkc_normalize(value)
    end

    def self.to_ascii(value)
      IDN::Idna.toASCII(value)
    end

    def self.to_unicode(value)
      IDN::Idna.toUnicode(value)
    end
  end
end
