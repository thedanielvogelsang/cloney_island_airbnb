module ExperienceHelper

  def create_experience
    exp = create(:experience)
    exp.user.roles << host_role
    images = create_images
    exp.experience_images << images
    exp
  end

  def create_many_experiences
    exps = create_list(:experience, 4)
    role = host_role
    exps.each { |e| e.user.roles << role }
  end

  def host_role
    create(:role, name: "host")
  end

  def create_images
    create_list(:experience_image, 4)
  end

end
