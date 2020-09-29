package proto

import (
	"encoding/json"
	"strings"

	timestamp "github.com/golang/protobuf/ptypes/timestamp"
)

// this Adds allows to fix some data unmarshaling errors

func CampaignFromBytes(data []byte) (*Campaign, error) {
	m := make(map[string]string)
	if err := json.Unmarshal(data, &m); err != nil {
		return nil, err
	}
	return campaignFromMap(m), nil
}

func ListCampaignsFromBytes(data []byte) (*Campaigns, error) {
	m := make(map[string][]map[string]string)
	if err := json.Unmarshal(data, &m); err != nil {
		return nil, err
	}
	campaigns := &Campaigns{}
	for _, camp := range m["campaigns"] {
		c := campaignFromMap(camp)
		campaigns.Campaigns = append(campaigns.Campaigns, c)
	}
	return campaigns, nil
}

func SupportRoleFromBytes(data []byte) (*SupportRole, error) {
	m := make(map[string]string)
	if err := json.Unmarshal(data, &m); err != nil {
		return nil, err
	}

	return supportRoleFromMap(m), nil
}

func ListSupportRolesFromBytes(data []byte) (*SupportRoles, error) {
	m := make(map[string][]map[string]string)
	if err := json.Unmarshal(data, &m); err != nil {
		return nil, err
	}
	sRoles := &SupportRoles{}
	for _, s := range m["support_roles"] {
		r := supportRoleFromMap(s)
		sRoles.SupportRoles = append(sRoles.SupportRoles, r)
	}
	return sRoles, nil
}

func supportRoleFromMap(m map[string]string) *SupportRole {

	return &SupportRole{
		Id:        m["id"],
		Name:      m["name"],
		Comment:   m["comment"],
		Mandatory: false,
		Uom:       m["uom"],
	}
}

func campaignFromMap(m map[string]string) *Campaign {
	return &Campaign{
		CampaignId:        m["campaign_id"],
		CampaignName:      m["campaign_name"],
		LogoUrl:           m["logo_url"],
		Goal:              m["goal"],
		CrgQuantityMany:   getListFromString(m["crg_quantity_many"], ","),
		CrgIdsMany:        getListFromString(m["crg_ids_many"], ","),
		AlreadyPledged:    m["already_pledged"],
		ActionTime:        &timestamp.Timestamp{},
		ActionLocation:    m["action_location"],
		CampaignStill:     m["campaign_still"],
		MinPioneers:       m["min_pioneers"],
		MinRebelsForMedia: m["min_rebels_for_media"],
		MinRebelsToWin:    m["min_rebels_to_win"],
		ActionType:        m["action_type"],
		BackingOrg:        getListFromString(m["backing_org"], ","),
		Category:          m["category"],
		Contact:           m["contact"],
		HistPrecedents:    m["hist_precedents"],
		Organization:      m["organization"],
		Strategy:          m["strategy"],
		VideoUrl:          getListFromString(m["video_url"], ","),
		Uom:               m["uom"],
	}
}

func getListFromString(data, sep string) []string {
	return strings.Split(data, sep)
}
