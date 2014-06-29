module TracksHelper
  def track_form_class
    "form-inline" if controller_name == "albums" && action_name == "show"
  end

  def track_form_field_class
    "input-sm" if controller_name == "albums" && action_name == "show"
  end

  def track_form_action_class
    "btn-sm " if controller_name == "albums" && action_name == "show"
  end

  def track_submit_text
     if controller_name == "albums" && action_name == "show"
       "Add"
     else
       "Save"
     end
  end
end
