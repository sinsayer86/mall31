package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.ProductCommon;

@Mapper
public interface ProductCommonMapper {
	public int selectRowCount(); //product_comment테이블 총 행 수 카운트
	public List<ProductCommon> selectProductCommonList(Map<String, Object> map);
	public ProductCommon selectProductCommonByCategory(int productCommonNo);
	public ProductCommon selectProductCommonByCategoryForNotProduct(int productCommonNo);
}
