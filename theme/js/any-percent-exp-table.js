function anyPercentExpTable() {
    
    var self = this;
    self.tableSelector = ".exp-table.any-percent";

    /**
     * Init
     */
    self.init = function() {
        
    };
}

// Instanciate & init
window.addEventListener('load', function() {
    let anyPercentExpTableObj = new anyPercentExpTable();
    anyPercentExpTableObj.init();
})