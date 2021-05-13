import flatpickr from "flatpickr"
import { Latvian } from "flatpickr/dist/l10n/lv.js"

$(document).on "turbolinks:load", ->
  flatpickr ".datepicker",
    enableTime: true
    dateFormat: "d.m.Y, H:i"
    "locale": Latvian
  return
