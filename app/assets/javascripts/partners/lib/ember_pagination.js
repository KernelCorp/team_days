;(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
// Generated by CoffeeScript 1.6.3
    (function() {
        DS.PaginationFixtureAdapter = DS.FixtureAdapter.extend({
            setStoreMetadata: function(store, type, k, v) {
                var res;
                res = store.typeMapFor(type).metadata;
                return res[k] = v;
            },
            findAll: function(store, type) {
                var all, res;
                this.setStoreMetadata(store, type, 'page', 1);
                all = this.fixturesForType(type);
                res = all.slice(0, 1);
                this.setStoreMetadata(store, type, 'total_pages', all.length);
                this.setStoreMetadata(store, type, 'unfiltered_total_pages', all.length);
                return res;
            },
            queryFixtures: function(fixtures, query, type) {
                var page, start;
                page = query.page || 1;
                if (this.get('store')) {
                    setStoreMetadata(this.get('store'), type, "page", page);
                }
                start = (page - 1) * 1;
                return fixtures.slice(start, start + 1);
            }
        });

    }).call(this);

},{}],2:[function(require,module,exports){
// Generated by CoffeeScript 1.6.3
    (function() {
        require("./pagination_module");

        require("./fixture_adapter");

        require("./pagination_controller");

    }).call(this);

},{"./fixture_adapter":1,"./pagination_controller":3,"./pagination_module":4}],3:[function(require,module,exports){
// Generated by CoffeeScript 1.6.3
    (function() {
        Em.PaginationController = Em.ArrayController.extend(Em.PaginationModule);

    }).call(this);

},{}],4:[function(require,module,exports){
// Generated by CoffeeScript 1.6.3
    (function() {
        Em.PaginationModule = {
            modelClass: function() {
                return this.modelInfo["class"];
            },
            modelNameForStore: function() {
                return this.modelInfo.store;
            },
            storeMetadata: function(k) {
                var res;
                res = this.store.typeMapFor(this.modelClass()).metadata;
                if (k) {
                    res = res[k];
                }
                return res;
            },
            setStoreMetadata: function(k, v) {
                var res;
                res = this.store.typeMapFor(this.modelClass()).metadata;
                return res[k] = v;
            },
            loadMore: function() {
                var page;
                page = this.storeMetadata('page') + 1;
                this.setStoreMetadata('page', page);
                this.store.findQuery(this.modelNameForStore(), {
                    page: page
                });
                return page;
            },
            hasMoreFunc: function() {
                var page, total, unfiltered;
                page = this.storeMetadata('page');
                total = this.storeMetadata('total_pages');
                unfiltered = total;
                return !unfiltered || page < unfiltered;
            },
            actions: {
                showMore: function() {
                    var page;
                    page = this.loadMore();
                    return this.set('lastKnownPage', page);
                }
            },
            hasMore: (function() {
                return this.hasMoreFunc();
            }).property('lastKnownPage', 'firstObject', '@each', 'filtered.@each')
        };

    }).call(this);

},{}]},{},[2])
;