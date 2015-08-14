Question.destroy_all
Comment.destroy_all
Vote.destroy_all

Question.create!([
  {
    body: "Is it a stack or a queue thats FIFO?" 
  },
  {
    body: "How many questions are on the quiz tomorrow?" 
  },
  {
    body: "What is the running time of radix tree? Why use them?" 
  },
  {
    body: "Can someone repeat what the instructor said about Dijkstra's runtime?" 
  },
  {
    body: "Does anyone have the link to tomorrow's homework assignment?" 
  },
  {
    body: "Arrived a bit late, is the quiz still on for today?" 
  }
])

questions = Question.all

Comment.create!([
  {
    question_id: questions[0].id,
    body: "That would be a queue"
  },
  {
    question_id: questions[1].id,
    body: "I heard 30"
  },
  {
    question_id: questions[1].id,
    body: "30 is correct. 20 multiple choice 10 short answer"
  },
  {
    question_id: questions[2].id,
    body: "Lookup, insertion, and deletion in O(n).  Even though radix trees aren't in the class of O(log n), they often have less comparisons and less nodes than balanced trees"
  }
])

Vote.create!([
  {
    question_id: questions[3].id,
    up: 1
  },
  {
    question_id: questions[3].id,
    up: 1
  },
  {
    question_id: questions[3].id,
    up: 1
  },
  {
    question_id: questions[3].id,
    up: 1
  },
  {
    question_id: questions[2].id,
    up: 1
  },
  {
    question_id: questions[1].id,
    up: 1
  },
  {
    question_id: questions[0].id,
    up: 1
  }
])
