require 'test_helper'

class FormSheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_sheet = form_sheets(:one)
  end

  test "should get index" do
    get form_sheets_url
    assert_response :success
  end

  test "should get new" do
    get new_form_sheet_url
    assert_response :success
  end

  test "should create form_sheet" do
    assert_difference('FormSheet.count') do
      post form_sheets_url, params: { form_sheet: { content: @form_sheet.content, title: @form_sheet.title } }
    end

    assert_redirected_to form_sheet_url(FormSheet.last)
  end

  test "should show form_sheet" do
    get form_sheet_url(@form_sheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_sheet_url(@form_sheet)
    assert_response :success
  end

  test "should update form_sheet" do
    patch form_sheet_url(@form_sheet), params: { form_sheet: { content: @form_sheet.content, title: @form_sheet.title } }
    assert_redirected_to form_sheet_url(@form_sheet)
  end

  test "should destroy form_sheet" do
    assert_difference('FormSheet.count', -1) do
      delete form_sheet_url(@form_sheet)
    end

    assert_redirected_to form_sheets_url
  end
end
