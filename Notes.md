## Authors

```
mix phx.gen.html Authors Author authors name:string
```

## Users

```
mix phx.gen.auth Accounts User users
```

I added a field for username. for simplicity, no profiles just yet

## Books & Quests

Next, we generate the books and quests

```
mix phx.gen.html Books Book books \
    title:string cover:string author_id:references:authors \
    description:string goodreads_url:string user_id:references:users

mix phx.gen.live Quests Quest quests \
    title:string description:string tags:array:string author_id:references:users

mix phx.gen.schema QuestBook quest_books \
    quest_id:references:quests book_id:references:books
```

## Completing a book/quest

Finally, users can complete books, mark them as read, favorite them

```
mix phx.gen.json Activity BookStatus book_statuses user_id:references:users book_id:references:books status:string
```

Quest completion might be a little easier, since we might just check periodically if the user has completed a quest, and update this table when they do

```
mix phx.gen.json Activity QuestStatus quest_statuses user_id:references:users quest_id:references:quests completed:integer
```

## Random google searches

[live updating text input with phoenix](https://elixirforum.com/t/updating-dom-on-phx-change-on-text-input/28285)

[case insensitive search](https://www.viget.com/articles/case-insensitve-string-columns-with-postgres-phoenix-and-ecto/)

[seed data](https://dev.to/noelworden/elixir-phoenix-importing-csv-data-seeding-data-2b7p)
[bulk upserts](https://hexdocs.pm/ecto/constraints-and-upserts.html)