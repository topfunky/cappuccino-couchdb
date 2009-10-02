/*
 * CPDictionary+ParamUtils.j
 * cappuccino-couchdb
 *
 * Created by Geoffrey Grosenbach on October 1, 2009.
 * MIT Licensed.
 */

@import <Foundation/CPDictionary.j>

// Translated from the HTTPRiot project by Justin Palmer.
// http://github.com/Caged/httpriot/blob/master/Source/HTTPRiot/Extensions/NSDictionary+ParamUtils.m

@implementation CPDictionary (ParamUtils)

- (CPString)toQueryString
{
    var pairs = [[CPArray alloc] init];

    var key = nil,
        keyEnumerator = [self keyEnumerator];

    while (key = [keyEnumerator nextObject])
    {
        var value = [self objectForKey:key];
        if ([value isKindOfClass:[CPArray class]]) {
            var val = nil,
                valueEnumerator = [value objectEnumerator];
            while (val = [valueEnumerator nextObject])
            {
                [pairs addObject:[CPString stringWithFormat:@"%@=%@",key, encodeURIComponent(val)]];
            }
        } else {
            [pairs addObject:[CPString stringWithFormat:@"%@=%@",key, encodeURIComponent(value)]];
        }
    }
    return [pairs componentsJoinedByString:@"&"];
}

@end
