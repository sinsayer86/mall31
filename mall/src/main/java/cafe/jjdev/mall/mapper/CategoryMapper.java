package cafe.jjdev.mall.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import cafe.jjdev.mall.vo.Category;

@Mapper
public interface CategoryMapper {
	public Category selectCategory(int categoryNo); //카테고리 이름 가져오는 메서드
	public List<Category> selectCategoryList();
}
