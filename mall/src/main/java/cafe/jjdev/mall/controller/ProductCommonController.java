package cafe.jjdev.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.ProductCommenService;
import cafe.jjdev.mall.vo.ProductCommon;

@Controller
public class ProductCommonController {
	@Autowired ProductCommenService productCommenService;
	
	// 상품 상세보기
	@GetMapping("/product/getProductOne")
	public String getProductOne(int productCommonNo, Model model) {
		ProductCommon productCommon = productCommenService.getProductOne(productCommonNo);
		
		model.addAttribute("productCommon", productCommon);
		return "/product/getProductOne";
	}
	
	// 카테고리별 리스트
	@GetMapping("/product/getProductListByCategory")
	public String getProductListByCategory(@RequestParam(required = false, defaultValue = "") String searchWord,
											@RequestParam(required = false, defaultValue = "1") int currentPage, int categoryNo, Model model) {
		Map<String, Object> map = productCommenService.getProductCommonListByCategory(categoryNo, currentPage, searchWord); //리스트 불러오기
		model.addAttribute("list", map.get("list"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("categoryName", map.get("categoryName"));
		return "/product/getProductListByCategory";
	}
}
