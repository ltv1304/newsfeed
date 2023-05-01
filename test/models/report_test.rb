require "test_helper"

class ReportTest < ActiveSupport::TestCase
  def setup
    @report = Report.new(title: 'Lorem Ipsum', content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec egestas leo. Duis molestie sed dolor eget vestibulum. Donec semper, ipsum vestibulum ornare pharetra, urna tortor lao
      reet dolor, feugiat dignissim augue eros nec orci. Donec pellentesque, sapien vitae tincidunt iaculis, ipsum urna volutpat ipsum, sit amet blandit lectus orci non eros. Suspendisse interdum libero at libero consectetur eleifend. Nunc maximus sapie
      n eu pulvinar aliquet. Sed laoreet bibendum rutrum. Aenean vitae porttitor nisl, vitae efficitur sem. Pellentesque facilisis aliquam tellus sed condimentum. Nulla sodales ex quis nisl egestas euismod. Etiam in feugiat lectus, sit amet pulvinar mas
      sa. Sed commodo molestie leo, et aliquet massa pellentesque nec.')
    
  end

  test "should be valid" do
    assert @report.valid?
  end

  test 'title shuld be present' do
    @report.title = " "
    assert_not @report.valid?
  end

  test 'content shuld be present' do
    @report.content = " "
    assert_not @report.valid?
  end

  test 'title should not be too long' do
    @report.title = "a"*251
    assert_not @report.valid?
  end
end
