public class partyPageController {
    
    public List<Party__c> partyList{get;set;}
    public List<Character__c> charList{get;set;}
    public List<Player__c> playas{get;set;}
    public DnDCampaign__c camp{get;set;}
    public Party__c selectedParty{get;set;}
    
    public partyPageController() {
        getPartyList();
    }
    
    public void getPartyList() {
        partyList = [SELECT name, realm__c, region__c, (select name FROM characters__r) FROM party__c];
    }
    
    // This method fires when you click on an item in the "Party" table. It should show:
    // 1. The characters in the party
    // 2. The players pertaining to each character
    // 3. The campaign the party is in
    // 4. The Dungeon Master for this campaign
    // Is it time to use a wrapped class?
    public void additionalInfo() {
        getChars();
        getPlayas();
        getCampaign();
    }
    
    public void getChars() {
        
    }
    
    public void getPlayas() {
        
    }
    
    public void getCampaign() {
        
    }
    
    public void getDM() {
        
    }
    
}