ActiveAdmin.register Post do
permit_params :title, :body, :image

  show do |t|
    attributes_table do
      row :title
      row :body
      row :image do
        post.image? ? image_tag(post.image.url, height: '100') : content_tag(:spam, "NO PHOTO YET")
      end
    end
  end

  form :html => { :enctype => "multipart/form-data"} do  |f|
    f.inputs do
      f.inputs :title
      f.inputs :body
      f.inputs :image, hint: f.post.image? ? image_tag(post.image.url, height: '100') : content_tag(:spam, "UPLOAD JPG/PNG/GIF IMAGE")
    end
    f.actions
  end

end
