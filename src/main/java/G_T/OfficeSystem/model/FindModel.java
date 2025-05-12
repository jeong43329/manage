package G_T.OfficeSystem.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

@Service
@Scope(value=WebApplicationContext.SCOPE_SESSION,proxyMode=ScopedProxyMode.TARGET_CLASS)
public class FindModel{
	private List<UserInfoModel> allUserList; //검색결과일람
	private List<UserInfoModel> showUserList;
	private int showNumber;
	private int currentPage;
	private String sortOrder;
	private String sortColumn;

	@Autowired
	private UserInfoModelDAO userInfoModelDAO;

	public FindModel() {
		showNumber=10;
		currentPage=1;
		sortOrder="▲";
		sortColumn="ユーザーID";
	}

	public List<UserInfoModel> getAllUserList(){
		return allUserList;
	}
	public void setAllUserList(List<UserInfoModel> allUserList) {
		this.allUserList=allUserList;
	}

	//유저정보를 검색하고 검색결과일람에 설정한다
	public void FindUser(FindConditionModel condition) {
		setAllUserList(userInfoModelDAO.FindUser(condition));
		SortAll(sortColumn,sortOrder);
		GetPage(showNumber,currentPage);
	}
	

	public void GetPage(int showNumber,int currentPage) {
		if(showNumber==0||allUserList.size()<=showNumber) {
			showUserList=allUserList;
		}
		else {
			showUserList=IntStream.range(0,allUserList.size())
					.filter(index->index>=(currentPage-1)*showNumber&&index<currentPage*showNumber)
					.mapToObj(allUserList::get)

					.collect(Collectors.toList());
		}
		this.showNumber=showNumber;
		this.currentPage=currentPage;
	}

	public void SortAll(String sortColumn,String sortOrder) {
		Collections.sort(this.allUserList,new Comparator<UserInfoModel>() {
			public int compare(UserInfoModel u1,UserInfoModel u2) {
				int invertFlag=-1;
				if (sortOrder == null || sortOrder.equals("") || sortOrder.equals("▲")) {
					invertFlag=1;
				}
				if(sortColumn==null) {
					return invertFlag*1;
				}
				if(sortColumn.equals("ユーザーID")) {
					return invertFlag*(u1.getUserId().compareTo(u2.getUserId())>0?1:-1);
				}
				else if(sortColumn.equals("氏名")) {
					return invertFlag*(u1.getUserName().compareTo(u2.getUserName())>0?1:-1);
				}
				else if (sortColumn.equals("電話番号")) {
					// "電話番号"列でソートする
						return invertFlag * (u1.getTel().compareTo(u2.getTel()) > 0 ? 1 : -1);
				} else if (sortColumn.equals("郵便番号")) {
					// "郵便番号"列でソートする
						return invertFlag * (u1.getPostcode().compareTo(u2.getPostcode()) > 0 ? 1 : -1);
				} else if (sortColumn.equals("住所")) {
					// "住所"列でソートする
						return invertFlag * (u1.getAddress().compareTo(u2.getAddress()) > 0 ? 1 : -1);
				}
				else if(sortColumn.equals("性別")) {

						return invertFlag * (u1.getSex().compareTo(u2.getSex()) > 0 ? 1 : -1);
				}
				else {
						return invertFlag*1;
					}
			}

		});
		this.sortColumn=sortColumn;
		this.sortOrder=sortOrder;
		GetPage(showNumber,1);
	}
	public void Sort(String sortColumn,String sortOrder) {
		SortAll(sortColumn,sortOrder);
		GetPage(showNumber,1);
	}

	public List<UserInfoModel> getShowUserList(){
		return showUserList;
	}
	public void setShowUserList(List<UserInfoModel> showUserList) {
		this.showUserList=showUserList;
	}

	public int getShowNumber() {
		return showNumber;
	}
	public void setShowNumber(int showNumber) {
		this.showNumber=showNumber;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage=currentPage;
	}
	public String getSortOrder() {
		System.out.println("FindModel.getSortOrder");
		return sortOrder;
	}
	public void setSortOrder(String sortOrder) {
		System.out.println("FindModel.setSortOrder");

		this.sortOrder=sortOrder;
	}
	public String getSortColumn() {
		System.out.println("FindModel.getSortColumn");
		return sortColumn;
	}
	public void setSortColumn(String sortColumn) {
		System.out.println("FindModel.setSortColumn");
		this.sortColumn=sortColumn;
	}
}

