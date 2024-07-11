package dapp.repository;

import java.util.ArrayList;
import java.util.List;

import dapp.model.VenderModel;

public class VenderRepoImpl extends DBParent implements VenderRepo{

	List<VenderModel> list;
	@Override
	public boolean isAddNewVender(VenderModel model) {
		
		try {
			stmt=conn.prepareStatement("insert into vender values('0',?)");
			stmt.setString(1, model.getV_name());
			int value=stmt.executeUpdate();
			if(value>0) {
				return true;
			}
			else {
				return false;
			}
		}
		catch(Exception ex) {
			System.out.println("Error is:- "+ex);
			return false;
		}
		
	}

	@Override
	public List<VenderModel> getVenderList() {
		
		try {
			list=new ArrayList<VenderModel>();
			stmt=conn.prepareStatement("select *from vender");
			rs=stmt.executeQuery();
			while(rs.next()) {
				VenderModel vmodel=new VenderModel();
				vmodel.setV_id(rs.getInt(1));
				vmodel.setV_name(rs.getString(2));
				this.list.add(vmodel);
			}
			return list.size()>0?list:null;
		}
		catch(Exception ex) {
			System.out.println("Error is:- "+ex);
			return null;
		}
	}

	@Override
	public boolean isDeleteVenderById(int v_id) {
		
		try {
			stmt=conn.prepareStatement("delete from vender where vid=?");
			stmt.setInt(1, v_id);
			int value=stmt.executeUpdate();
			return value>0?true:false;
		}
		catch(Exception ex) {
			System.out.println("Error is:- "+ex);
			return false;
		}
		
	}

	@Override
	public List<VenderModel> getVenderListByName(String vname) {
		try {
			list=new ArrayList<VenderModel>();
			stmt=conn.prepareStatement("select *from vender where vname like '%"+vname+"%' ");
			rs=stmt.executeQuery();
			while(rs.next()) {
				VenderModel vmodel=new VenderModel();
				vmodel.setV_id(rs.getInt(1));
				vmodel.setV_name(rs.getString(2));
				this.list.add(vmodel);
			}
			return this.list.size()>0?list:null;
		}
		catch(Exception ex) {
			System.out.println("Error is:- "+ex);
			return null;
		}
	}
}
