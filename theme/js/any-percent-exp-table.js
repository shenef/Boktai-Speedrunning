function anyPercentExpTable() {
    
    var self = this;
    self.tableSelector = ".exp-table.any-percent";

    /**
     * Init
     */
    self.init = function() {
        self.addClasses();
    };

    /**
     * Add classes to the table
     */
    self.addClasses = function() {
        
        // Check if table is present
        const table = document.querySelectorAll(self.tableSelector);
        console.log(table);
        if(table.length > 0) {
            
            // Get rows
            let rows = table[0].getElementsByTagName("tr");
            for(let r = 0; r < rows.length; r++) {

                // Skip the first row because it just has the column names
                if(r === 1) {
                    continue;
                }

                // For each row, get the columns
                let columns = rows[r].getElementsByTagName("td");
                for(let c = 0; c < columns.length; c++) {

                    // Add classes to specific columns
                    switch(c) {
                        case 1:         // Sol lens EXP
                        case 2:
                            columns[c].classList.add("c-sol");
                            break;
                        case 3:         // Frost lens EXP
                        case 4:
                            columns[c].classList.add("c-frost");
                            break;
                        default:
                            // Do nothing
                            break;
                    }
                }
            }
        }
    }
}

// Instanciate & init
window.addEventListener('load', function() {
    let anyPercentExpTableObj = new anyPercentExpTable();
    anyPercentExpTableObj.init();
})