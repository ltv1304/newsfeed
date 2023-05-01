require "test_helper"

class UserBehaviourTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: 'test101@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'user', mailing_period: 'cancel'})
    @editor = User.create(email: 'test102@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'editor', mailing_period: 'cancel'})
    @admin = User.create(email: 'test103@test.com', password: '123456', password_confirmation: '123456', 'profile_attributes': {name: 'test', role: 'admin', mailing_period: 'cancel'})
    @report = Report.create(title: 'test', content: 'test')
  end

  test 'guest users behaviour' do
    get root_path
    assert_response :success

    get report_path(@report)
    assert_response :success
  
  end
  
  
  test 'authenticated users behaviour' do
    get root_path
    assert_response :success

    get new_user_session_path
    post user_session_path, params: {user: { email: @user.email, password: @user.password }}
    follow_redirect!

    get user_path(@user)
    assert_response :success

    get edit_user_registration_path(@user)
    assert_response :success

  end

  test 'editor behaviour' do
    initial_report_title = 'test1'
    new_report_title = 'test2'
    report_content = 'test1'

    get new_user_session_path
    post user_session_path, params: {user: { email: @editor.email, password: @editor.password }}
    follow_redirect!
    
    get root_path
    assert_select "div[class=card]", count: 1

    get new_editor_report_path
    assert_response :success
    post editor_reports_path, params: {report: { title: initial_report_title, content: report_content }}
    follow_redirect!
    assert_template '/'
    assert_select "div[class=card]", count: 2
    assert_select 'h4', { text: initial_report_title }
    assert_select 'p', { text: report_content }

    get edit_editor_report_path(@report)
    patch editor_report_path(@report), params: {report: { title: new_report_title, content: report_content }}
    follow_redirect!
    assert_template '/'
    assert_select "div[class=card]", count: 2
    assert_select 'p', { text: report_content }
  end

  test 'admin behaviour' do
    get new_user_session_path
    post user_session_path, params: {user: { email: @admin.email, password: @admin.password }}
    follow_redirect!

    get admin_users_path
    assert_response :success
  end
end
