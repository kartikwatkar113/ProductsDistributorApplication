package dapp.repository;

import java.util.List;

import dapp.model.VenderModel;

public interface VenderRepo {

	public boolean isAddNewVender(VenderModel model);

	public List<VenderModel> getVenderList();
	
	public boolean isDeleteVenderById(int v_id);
	
	public List<VenderModel> getVenderListByName(String vname);
}
