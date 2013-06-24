require 'test_helper'

class BootstrapSassRTLTest < ActionDispatch::IntegrationTest
  teardown { clean_cache }

  test "engine is loaded" do
    assert_equal ::Rails::Engine, Bootstrap::Sass::RTL::Engine.superclass
  end

  test "bootstrap.css inside bootstrap-rtl is served" do
    get "/assets/bootstrap-rtl/bootstrap.css"
    assert_response :success
  end

  test "responsive.css within bootstrap-rtl is served" do
    get "/assets/bootstrap-rtl/responsive.css"
    assert_response :success
  end

  test "bootstrap-rtl.css is served" do
    get "/assets/bootstrap-rtl.css"
    assert_response :success
  end

  test "bootstrap-responsive-rtl.css is served" do
    get "/assets/bootstrap-responsive-rtl.css"
    assert_response :success
  end

  private
  def clean_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end
end
