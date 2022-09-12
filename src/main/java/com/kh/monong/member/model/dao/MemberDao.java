package com.kh.monong.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.monong.direct.model.dto.DirectProduct;
import com.kh.monong.direct.model.dto.DirectProductAttachment;
import com.kh.monong.member.model.dto.Member;
import com.kh.monong.member.model.dto.Seller;
import com.kh.monong.member.model.dto.SellerInfo;
import com.kh.monong.member.model.dto.SellerInfoAttachment;

@Mapper
public interface MemberDao {

	//------------------------수진 시작
	@Select("select * from member where member_id = #{memberId}")
	Member selectMemberById(String memberId);
	
	@Select("select * from member where member_email = #{email} and member_quit_date is null")
	Member selectmemberByEmail(String email);

	@Insert("insert into member values(#{memberId}, #{memberName}, #{memberPassword}, #{memberEmail}, #{memberAddress}, #{memberAddressEx}, #{memberPhone}, #{memberBirthday}, default, default, null, 'Y')")
	int insertMember(Member member);

	@Insert("insert into member_authority values(#{memberAuth}, #{memberId})")
	int insertMemberAuth(Map<String, Object> memberAuthMap);

	
	int insertEmailIdentify(Map<String, Object> map);
	
	@Select("select identify_key from member_email_identify where member_email = #{email}")
	String getEmailKey(String email);
	
	@Insert("insert into seller_info values(#{memberId}, #{sellerRegNo}, #{sellerName}, 'REG_W', null, null, default)")
	int insertSellerInfo(SellerInfo sellerInfo);
	
	@Insert("insert into seller_info_attachment values(seq_seller_attach_no.nextval, #{memberId}, #{originalFilename}, #{renamedFilename})")
	int insertSellerInfoAttachment(SellerInfoAttachment attachment);
	
	@Select("select * from seller_info where member_id = #{memberId}")
	SellerInfo selectSellerInfo(String memberId);
	
	List<DirectProduct> selectDirectListBySellerId(Map<String, Object> param);
	
	@Select("select * from direct_product_attachment where d_product_no = #{dProductNo}")
	List<DirectProductAttachment> selectDirectAttachments(String dProductNo);
	
	int getTotalProdCntBySeller(Map<String, Object> param);
	
	List<Map<String, Object>> selectOrderListByProdNo(Map<String, Object> param);
	
	int getTotalOrderCntByProdNo(Map<String, Object> param);

	//------------------------수진 끝 
	
	//------------------------수아 시작

	@Select("select * from member where member_name = #{name} and member_email = #{email}")
	Member findMemberId(Map<String, Object> map);

	@Update("update member set member_password = #{memberTempPw} where member_email = #{email}")
	int updateTempPw(Map<String, Object> map);

	@Update("update member set member_name=#{memberName}, member_birthday = #{memberBirthday}, member_email = #{memberEmail}, member_phone = #{memberPhone}, member_address=#{memberAddress} where member_id = #{memberId}")
	int updateMember(Member member);

	@Update("update member set member_password = #{encodedPassword} where member_id= #{memberId}")
	int updatePw(Map<String, Object> map);

	@Select("select d_product_name from direct_product where d_product_no = #{prodNo}")
	String selectProdNameByNo(String prodNo);
	
	
	//------------------------수아 끝

	
}
