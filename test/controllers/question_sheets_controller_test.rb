require 'test_helper'

class QuestionSheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_sheet = question_sheets(:one)
  end

  test "should get index" do
    get question_sheets_url
    assert_response :success
  end

  test "should get new" do
    get new_question_sheet_url
    assert_response :success
  end

  test "should create question_sheet" do
    assert_difference('QuestionSheet.count') do
      post question_sheets_url, params: { question_sheet: { content: @question_sheet.content, title: @question_sheet.title } }
    end

    assert_redirected_to question_sheet_url(QuestionSheet.last)
  end

  test "should show question_sheet" do
    get question_sheet_url(@question_sheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_sheet_url(@question_sheet)
    assert_response :success
  end

  test "should update question_sheet" do
    patch question_sheet_url(@question_sheet), params: { question_sheet: { content: @question_sheet.content, title: @question_sheet.title } }
    assert_redirected_to question_sheet_url(@question_sheet)
  end

  test "should destroy question_sheet" do
    assert_difference('QuestionSheet.count', -1) do
      delete question_sheet_url(@question_sheet)
    end

    assert_redirected_to question_sheets_url
  end
end
