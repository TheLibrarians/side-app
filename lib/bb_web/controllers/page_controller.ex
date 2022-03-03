defmodule BbWeb.PageController do
  use BbWeb, :controller

  def index(conn, _params) do
    quest = %{
      description:
        "
      The world into which Mycroft and Carlyle have been born is as strange to our 21st-century eyes as ours would be to a native of the 1500s. It is a hard-won utopia built on technologically-generated abundance, and also on complex and mandatory systems of labeling all public writing and speech. What seem to us normal gender distinctions are now distinctly taboo in most social situations. And most of the world's population is affiliated with globe-girdling clans of the like-minded, whose endless economic and cultural competition is carefully managed by central planners of inestimable subtlety. To us it seems like a mad combination of heaven and hell. To them, it seems like normal life..",
      title: "heroes with issues",
      stats: %{
        ratings: 1127,
        comments: 1234
      },
      author: %{name: "Zen", url: "#"},
      books: [
        %{
          title: "The Shadow of the Torturer",
          cover:
            "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1329650008l/60211.jpg",
          author: %{name: "Gene Wolfe", url: "#"},
          description:
            "The Shadow of the Torturer is the first volume in the four-volume series, The Book of the New Sun. It is the tale of young Severian, an apprentice in the Guild of Torturers on the world called Urth, exiled for committing the ultimate sin of his profession - showing mercy toward his victim - and follows his subsequent journey out of his home city of Nessus",
          goodreads_url: "https://www.goodreads.com/book/show/60211.The_Shadow_of_the_Torturer"
        },
        %{
          title: "Too Like the Lightning",
          cover:
            "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1443106959l/26114545.jpg",
          author: %{
            name: "Ada Palmer",
            url: "#"
          },
          goodreads_url: "https://www.goodreads.com/book/show/26114545-too-like-the-lightning",
          description:
            "Mycroft Canner is a convict. For his crimes he is required, as is the custom of the 25th century, to wander the world being as useful as he can to all he meets. Carlyle Foster is a sensayer--a spiritual counselor in a world that has outlawed the public practice of religion, but which also knows that the inner lives of humans cannot be wished away.

          The world into which Mycroft and Carlyle have been born is as strange to our 21st-century eyes as ours would be to a native of the 1500s. It is a hard-won utopia built on technologically-generated abundance, and also on complex and mandatory systems of labeling all public writing and speech. What seem to us normal gender distinctions are now distinctly taboo in most social situations. And most of the world's population is affiliated with globe-girdling clans of the like-minded, whose endless economic and cultural competition is carefully managed by central planners of inestimable subtlety. To us it seems like a mad combination of heaven and hell. To them, it seems like normal life.
          ",
          friend_activity: [
            %{user: %{name: "Zen", url: "#"}, activity: "rated it 5 stars!", date: "2022-02-02"}
          ]
        },
        %{
          title: "Upstream: Selected Essays",
          cover:
            "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1460911565l/29358559.jpg",
          author: %{
            name: "Mary Oliver",
            url: "#"
          },
          goodreads_url: "https://www.goodreads.com/book/show/29358559-upstream",
          description:
            "Comprising a selection of essays, Upstream finds beloved poet Mary Oliver reflecting on her astonishment and admiration for the natural world and the craft of writing.  ",
          friend_activity: [
            %{user: %{name: "Madi"}, activity: "marked it to-read", date: "2022-02-02"}
          ],
          tags: [
            "Poetry",
            "read this if you want to cry"
          ],
          book_details: %{
            format: "Hardcover, 178 pages",
            published: "Published October 11th 2016 by Penguin Press"
          }
        }
      ]
    }

    render(conn, "index.html", quest: quest)
  end
end
