module ApplicationHelper
  def admin_layout
    'admin'
  end

  def my_layout
    'my'
  end

  def is_superadmin? obj
    return obj.role == Role.find_by_name(APP::ROLE_SUPERADMIN)
  end

  def is_admin? obj
    return obj.role == Role.find_by_name(APP::ROLE_ADMIN)
  end

  def is_editor? obj
    return obj.role == Role.find_by_name(APP::ROLE_EDITOR)
  end

  def is_admin_superadmin? obj
    is_admin?(obj) or is_superadmin?(obj)
  end

  def is_editor_admin_superadmin? obj
    is_admin?(obj) or is_editor?(obj) or is_superadmin?(obj)
  end

  def is_number? string
    true if Float(string) rescue false
  end

  def authentication_validation
    unless is_admin_superadmin?(current_user)
      flash[:warning] = "No permission!"
      redirect_to root_path
    end
  end

  def validate_phones_by_comma(phones)
    if phones.present?
      phones.split(',').map { |phone|
        replacements = ['-', '+', '(', ')', ' ']
        replacements.each {|replacemnt| phone = phone.gsub(replacemnt, '')}
        # p phone
        unless is_number?(phone)
          errors.add(:phones, ", #{phone}, is not a number!")
        end

        if phone.length < 9
          errors.add(:phones, ", #{phone}, is too short!")
        end

        if phone.length > 13
          errors.add(:phones, ", #{phone}, is too long! ")
        end
      }
    end
  end

  def is_user_have_companies? obj
    @user_companies = Company.find_by("user_id = #{obj}")
    return @user_companies.blank?
  end
end
