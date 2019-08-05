require "application_system_test_case"

class FormSheetsTest < ApplicationSystemTestCase
  setup do
    @form_sheet = form_sheets(:one)
  end

  test "visiting the index" do
    visit form_sheets_url
    assert_selector "h1", text: "Form Sheets"
  end

  test "creating a Form sheet" do
    visit form_sheets_url
    click_on "New Form Sheet"

    fill_in "Content", with: @form_sheet.content
    fill_in "Title", with: @form_sheet.title
    click_on "Create Form sheet"

    assert_text "Form sheet was successfully created"
    click_on "Back"
  end

  test "updating a Form sheet" do
    visit form_sheets_url
    click_on "Edit", match: :first

    fill_in "Content", with: @form_sheet.content
    fill_in "Title", with: @form_sheet.title
    click_on "Update Form sheet"

    assert_text "Form sheet was successfully updated"
    click_on "Back"
  end

  test "destroying a Form sheet" do
    visit form_sheets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Form sheet was successfully destroyed"
  end
end
