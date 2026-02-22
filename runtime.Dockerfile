FROM build_img AS build_source

FROM alpine:3.19
RUN apk add --no-cache nodejs npm
WORKDIR /app

COPY --from=build_source /app/dist ./dist
COPY --from=build_source /app/node_modules ./node_modules
COPY --from=build_source /app/package.json ./

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

EXPOSE 3000

CMD ["npm", "run", "start"]
