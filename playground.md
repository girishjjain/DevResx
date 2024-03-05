# Playground 

## Objective
To capture small scripts here in a central place for future reference.

## Typescript
* Using some date functions
```typescript
for (let y=2024; y<2035; y++) {
    for (let m=0; m<12; m++) {
        const partitionStart = new Date(Date.UTC(y, m, 1));
        const partitionEnd = m == 11 ? Date.UTC(y+1, 0, 1) : Date.UTC(y, m+1, 1);
        
        console.log(`CREATE TABLE IF NOT EXISTS rp_session_2_y${y}m${m+1} PARTITION OF rp_session_2 FOR VALUES FROM (${partitionStart.valueOf() / 1000}) TO (${partitionEnd.valueOf() / 1000});`);
    }
}
```