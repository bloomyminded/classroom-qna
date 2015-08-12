Question.destroy_all

Question.create!([
  {
  title: "Is it a stack or a queue thats FIFO?",
  description: "",
  upvote: 3
  },
  {
  title: "How many questions are on the quiz tomorrow?",
  description: "I may have misheard, can someone please confirm?",
  upvote: 10
  },
  {
  title: "What is the running time of radix tree?",
  description: "Is it O(n) or O(log(n))? If its O(n) why would we use it instead of a balanced tree?",
  upvote: 5
  },
  {
  title: "Can someone repeat what the instructor said about Dijkstra's runtime?",
  description: "",
  upvote: 0
  },
  {
  title: "Does anyone have the link to tomorrow's homework assignment?",
  description: "The instructor took it down before I could copy.",
  upvote: 1
  },
  {
  title: "Arrived a bit late, is the quiz still on for today?",
  description: "",
  upvote: 7
  }
])
