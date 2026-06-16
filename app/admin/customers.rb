ActiveAdmin.register Customer do
  # Allow the image to be saved along with the other fields
  permit_params :full_name, :phone_number, :email, :notes, :image

  # Build the new/edit form so it includes a file picker for the image
  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone_number
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end
end