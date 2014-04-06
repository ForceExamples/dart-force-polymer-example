part of chat_example_force;

@Controller()
class PostController {
  
  @RequestMapping(value: "/post/", method: "POST")
  Future<String> countMethod(req, Model model) {
     req.getPostParams().then((map) {
       model.addAttribute("name", map["name"]);
       
       req.async("name");
     });
     model.addAttribute("status", "ok");
     
     return req.asyncFuture;
  }
  
}