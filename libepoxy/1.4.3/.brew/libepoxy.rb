class Libepoxy < Formula
  desc "Library for handling OpenGL function pointer management"
  homepage "https://github.com/anholt/libepoxy"
  url "https://download.gnome.org/sources/libepoxy/1.4/libepoxy-1.4.3.tar.xz"
  sha256 "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"

  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on :python => :build if MacOS.version <= :snow_leopard

  def install
    # see https://github.com/anholt/libepoxy/pull/128
    inreplace "src/meson.build", "version=1", "version 1"
    mkdir "build" do
      system "meson", "--prefix=#{prefix}", ".."
      system "ninja"
      system "ninja", "test"
      system "ninja", "install"
    end
  end

  test do
    (testpath/"test.c").write <<-EOS.undent

      #include <epoxy/gl.h>
      #include <OpenGL/CGLContext.h>
      #include <OpenGL/CGLTypes.h>
      int main()
      {
          CGLPixelFormatAttribute attribs[] = {0};
          CGLPixelFormatObj pix;
          int npix;
          CGLContextObj ctx;

          CGLChoosePixelFormat( attribs, &pix, &npix );
          CGLCreateContext(pix, (void*)0, &ctx);

          glClear(GL_COLOR_BUFFER_BIT);
          CGLReleasePixelFormat(pix);
          CGLReleaseContext(pix);
          return 0;
      }
    EOS
    system ENV.cc, "test.c", "-L#{lib}", "-lepoxy", "-framework", "OpenGL", "-o", "test"
    system "ls", "-lh", "test"
    system "file", "test"
    system "./test"
  end
end
