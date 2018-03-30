export const fetchSearchGiphys = searchTerm => (
  $.ajax({
    method: 'get',
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`,
  })
);
