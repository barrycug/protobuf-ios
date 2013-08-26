Pod::Spec.new do |s|
  s.name         = "protobuf-ios"
  s.version      = "2.0.5"
  s.summary      = "Protocol Buffers - Google's data interchange format."
  s.homepage     = "https://code.google.com/p/protobuf"
  s.license      = { :type => 'GOOGLE', :file => 'COPYING.txt' }
	s.author       = "Google" 
  s.source       = { :svn => "http://protobuf.googlecode.com/svn/tags/2.5.0" }
  s.platform     = :ios, '5.0'
  s.header_dir = 'protobuf'
  s.public_header_files = 'config.h', 'src/**/*.h'
  s.source_files = 'config.h', 'src/**/*.{h,cc}'
	s.exclude_files = 'src/**/test_*', 'src/google/protobuf/compiler/', 'src/test/', 'src/**/*_unittest.cc'
	s.compiler_flags = '-I$(SRCROOT)/protobuf-ios/src -I$(SRCROOT)/protobuf-ios'

  s.xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++11',
    'CLANG_CXX_LIBRARY' => 'libc++',
    'USE_HEADERMAP' => 'NO',
  }
	
  s.pre_install do |pod, lib|
   if (pod.root + 'autogen.sh').exist?
     Dir.chdir(pod.root) do
		 	 `./autogen.sh`
     end
   end
   if (pod.root + 'configure').exist?
     Dir.chdir(pod.root) do
       `CC="clang -std=gnu99" CXX="clang++ -std=gnu++11 -stdlib=libc++" CXXFLAGS="-O3" ./configure`
     end
   end
  end

end
