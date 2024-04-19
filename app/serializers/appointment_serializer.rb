class AppointmentSerializer < ActiveModel::Serializer
  attributes :physician_id, :patient_id, :appointment_type, :appointment_date
end
