part of example_force_polymer;

@Controller
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