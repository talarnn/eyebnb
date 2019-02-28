import flatpickr from 'flatpickr';
import 'flatpickr/dist/flatpickr.css'
const startDateInput = document.getElementById('booking_beginning_date');
const endDateInput = document.getElementById('booking_end_date');

if ((startDateInput != null) && (endDateInput != null)) {
  flatpickr(startDateInput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
  });

  flatpickr(endDateInput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
  });
}