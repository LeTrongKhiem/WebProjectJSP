export function eventType(event) {
  let type;
  if (
    event.start.dateTime.isSame(event.end.dateTime, 'day') &&
    event.start.dateTime.isSame(event.end.dateTime, 'time') &&
    event.start.dateTime.format('hh:mm A') === '12:00 AM'
  ) {
    type = 'one-day-event';
  } else if (
    event.start.dateTime.isSame(event.end.dateTime, 'day') &&
    !event.start.dateTime.isSame(event.end.dateTime, 'time')
  ) {
    type = 'short-event';
  } else if (
    !event.start.dateTime.isSame(event.end.dateTime, 'day') &&
    event.start.dateTime.format('hh:mm A') === '12:00 AM'
  ) {
    type = 'long-event';
  } else {
    type = 'long-event-with-time';
  }

  return type;
}

export function eventTimePeriod(event, formats) {
  let time;

  if (eventType(event) === 'long-event') {
    time = `${event.start.dateTime.format(formats.date)} -
    ${event.end.dateTime.format(formats.date)}`;
  } else if (eventType(event) === 'long-event-with-time') {
    time = `${event.start.dateTime.format(formats.dateTime)} -
    ${event.end.dateTime.format(formats.dateTime)}`;
  } else if (eventType(event) === 'one-day-event') {
    time = `${event.start.dateTime.format(formats.date)}`;
  } else if (eventType(event) === 'short-event') {
    time = `${event.start.dateTime.format(formats.date)} <br>
    ${event.start.dateTime.format(formats.time)} - ${event.end.dateTime.format(formats.time)}`;
  }

  return time;
}
