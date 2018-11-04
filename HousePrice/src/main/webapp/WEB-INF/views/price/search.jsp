<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
{
	"success":${not empty searchResult},
	"data":[
		<c:forEach items="${searchResult}" var="item" varStatus="s" >
		{	
			"rnum":${item.rnum},
			"cre_year":${item.cre_year},
			"cre_month":${item.cre_month},
			"road_main_num":${item.road_main_num},
			"road_miner_num":${item.road_miner_num},
			"com_name":${item.com_name},
			"com_dong_name":${item.com_dong_name},
			"com_ho_name":${item.com_ho_name},
			"com_full_name":${item.com_full_name},
			"area":${item.area},
			"area_rank":${item.area_rank},
			"price":${item.price},
			"rnumId":${item.addrData.rnumId},
			"coord_x":${item.addrData.coord_x},
			"coord_y":${item.addrData.coord_y},
			"gu_code":${item.addrData.gu_code},
			"legal_dong_code":${item.addrData.legal_dong_code},
			"road_addr_full":${item.addrData.road_addr_full},
			"road_sido":${item.addrData.road_sido},
			"road_gungu":${item.addrData.road_gungu},
			"road_donglee":${item.addrData.road_donglee}
		}
		<c:if test="${not s.last}">,</c:if>
		</c:forEach>
	]	
}
