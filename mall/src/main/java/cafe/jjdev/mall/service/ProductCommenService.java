package cafe.jjdev.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import cafe.jjdev.mall.vo.ProductCommon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.mapper.CategoryMapper;
import cafe.jjdev.mall.mapper.ProductCommonMapper;

@Service
@Transactional
public class ProductCommenService {
	@Autowired private ProductCommonMapper productCommonMapper;
	@Autowired private CategoryMapper categoryMapper;
	
	// 상품 상세
	public ProductCommon getProductOne(int productCommonNo) {
		ProductCommon productCommon = productCommonMapper.selectProductCommonByCategory(productCommonNo);
		if(productCommon == null) {
			productCommon = productCommonMapper.selectProductCommonByCategoryForNotProduct(productCommonNo);
		}
		return productCommon;
	}
	
	// 상품 리스트 및 페이징
	public Map<String, Object> getProductCommonListByCategory(int categoryNo, int currentPage, String searchWord){
		int ROW_PER_PAGE = 10;
		int lastPage = productCommonMapper.selectRowCount();
		if(lastPage % ROW_PER_PAGE == 0) {
			lastPage = lastPage / ROW_PER_PAGE;
		}
		else {
			lastPage = lastPage / ROW_PER_PAGE + 1;
		}
		int startRow = (currentPage-1)*ROW_PER_PAGE;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("startRow", startRow);
		map.put("rowPerPage", ROW_PER_PAGE);
		map.put("searchWord", "%"+searchWord+"%");
		
		List<ProductCommon> list = productCommonMapper.selectProductCommonList(map);
		
		String categoryName = categoryMapper.selectCategory(categoryNo).getCategoryName();
		map.put("categoryName", categoryName);
		map.put("lastPage", lastPage);
		map.put("list", list);
		
		return map;
	}
}
