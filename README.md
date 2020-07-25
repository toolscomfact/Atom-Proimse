# GMSPromise
## 간단한사용법
new Promise().
Then(function(callback){
  // 함수1
  callback(파라메터);
})
.Then(function(callback, param)){
  // 함수2
  show_debug_message(param);
  throw;
}
.Catch(function(err){
  // 에러잡기
  show_debug_message(err);
})
.Go() // 
