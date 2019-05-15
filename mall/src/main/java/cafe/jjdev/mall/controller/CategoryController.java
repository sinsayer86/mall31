package cafe.jjdev.mall.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import cafe.jjdev.mall.service.CategoryService;

@Controller
public class CategoryController {
	@Autowired CategoryService categoryService;
}
