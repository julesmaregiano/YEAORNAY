function parseDate(date) {
  const parsed = Date.parse(date);
  if (!isNaN(parsed)) {
    return parsed;
  }

  return Date.parse(date.replace(' UTC', '').replace(' ', 'T'));
}
