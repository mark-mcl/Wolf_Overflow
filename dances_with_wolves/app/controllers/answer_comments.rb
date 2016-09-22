get '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])

  erb :"/comments/_new_answer_comment"
end

post '/answers/:id/comments' do
  comment = Comment.new(text: params[:text], commenter_id: session[:user_id], commentable_id: params[:id], commentable_type: 'Answer')
  answer = Answer.find(params[:id])

  if comment.save
    redirect "/questions/#{answer.question_id}"
  else
    erb :"/comments/_new_answer_comment"
  end
end

get '/answers/:id/comments/comment_id/edit' do
  comment = Comment.find(params[:comment_id])

  erb :"/comments/edit_answer_comment"
end

put '/answers/:id/comments/comment_id' do
  comment = Comment.find(params[:comment_id])
  comment.update_attributes(text: params[:text])
  answer = Answer.find(params[:id])

  redirect "/questions/#{answer.question_id}"
end

delete '/answers/:id/comments/:comment_id' do
  comment = Comment.find(params[:comment_id])
  comment.destroy
  answer = Answer.find(params[:id])

  redirect "/questions/#{answer.question_id}"
end
