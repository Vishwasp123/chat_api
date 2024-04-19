class AppointmentSerializer < ActiveModel::Serializer
  attributes  :patient_id, :appointment_type, :appointment_date, :physician_name

  def physician_name
    object.physician.name
    object.patient.name
  end
end
